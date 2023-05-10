import 'dart:io';

import 'package:dio/dio.dart';
import 'package:misoca_flutter/general/comm/app_dio.dart';
import 'package:misoca_flutter/general/repository/invoice_repository.dart';
import 'package:misoca_flutter/general/repository/token_repository.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../general/data/invoice.dart';
import '../../util/app_logger.dart';

class InvoiceListUseCase {
  static const NOT_MODIFIED = 304;

  Future<List<Invoice>> index() {
    return InvoiceRepository(InvoiceService(AppDio.getClient())).index();
  }

  Future<File> downloadPdf(int id) async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync();
    String? etag;
    try {
      logger.d(files);
      var curFile = files.firstWhere((file) => basename(file.path).indexOf("invoice_${id}") == 0);
      etag = RegExp(Invoice.PDF_FILE_FORMAT).firstMatch(basename(curFile.path))?.group(2);
      logger.d("curPdf ${etag}");
    } catch (e) {
      logger.d(e);
    }

    var file = File(join(dir.path, "invoice_${id}.pdf"));
    try {
      var response = await InvoiceRepository().pdf(id, etag, file.path);
      etag = response.headers.value("etag")?.replaceAll("W/", "").replaceAll("\"", "");
      if (etag != null) {
        file.renameSync(join(dir.path, "invoice_${id}_${etag}.pdf"));
        logger.d("pdf saved to ${join(dir.path, "invoice_${id}_${etag}.pdf")}");
      }
    } on DioError catch (e) {
      if (e.response?.statusCode != NOT_MODIFIED) {
        rethrow;
      }
      logger.d("304 received");
    }
    file = File(join(dir.path, "invoice_${id}_${etag}.pdf"));
    if (file.existsSync()) {
      return file;
    } else {
      throw Exception("file not saved");
    }
  }

  void logout() {
    final tokenRepo = TokenRepository();
    tokenRepo.clear();
  }
}
