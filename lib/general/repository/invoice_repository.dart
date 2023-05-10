import 'package:dio/dio.dart';
import 'package:misoca_flutter/general/comm/app_dio.dart';
import 'package:retrofit/http.dart';

import '../../util/app_logger.dart';
import '../data/invoice.dart';

part 'invoice_repository.g.dart';

@RestApi()
abstract class InvoiceService {
  factory InvoiceService(Dio dio, {String baseUrl}) = _InvoiceService;

  @GET("/api/v3/invoices")
  Future<List<Invoice>> index();
}

class InvoiceRepository {
  final InvoiceService _service;

  InvoiceRepository([InvoiceService? service]) : _service = service ?? InvoiceService(Dio());

  Future<List<Invoice>> index() {
    return _service.index();
  }

  Future<Response<dynamic>> pdf(int id, String? etag, String filePath) async {
    logger.d("download pdf(/api/v3/invoice/$id/pdf)");
    if (etag != null) {
      var options =
          Options(headers: {"If-None-Match": "\"$etag\""}, receiveDataWhenStatusError: false, responseType: ResponseType.bytes);
      return AppDio.getClient().download("/api/v3/invoice/$id/pdf", filePath, options: options);
    } else {
      var options = Options(receiveDataWhenStatusError: false, responseType: ResponseType.bytes);
      return AppDio.getClient().download("/api/v3/invoice/$id/pdf", filePath, options: options);
    }
  }
}
