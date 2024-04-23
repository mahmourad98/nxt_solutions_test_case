import 'dart:io';
import 'package:built_value/json_object.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nxt_test_case/config/app_end_points.dart';
import 'package:nxt_test_case/core/extras/helpers/remote_data_source_helper.dart';
import 'package:nxt_test_case/core/extras/services/app-network-service/common_response_model.dart';
import 'package:nxt_test_case/core/extras/services/app-network-service/dio_network_failure_type.dart';

import 'reservations_base_data_source.dart';

class ReservationsRemoteDataSource extends ReservationsBaseDataSource with RemoteDataSourceHelper {
  const ReservationsRemoteDataSource();
  /////////////////////////
  @override Future<Either<NetworkFailureError, CommonResponse>> getReservations() async{
    ///ADDING HEADERS TO OUR REQUEST
    final Map<String, dynamic> allHeaders = await getHttpRequestHeaders(
      addLocale: true, needAuth: true,
    );
    final url = getProperUrl(url: AppEndPoints.RESERVATIONS,);
    ///MAKING REQUEST TO SERVER
    try {
      final result = await networkService.getHttp<CommonResponse>(
        url: url,
        options: Options(headers: allHeaders,),
        responseConverter: (response,) {
          response.data = CommonResponse().rebuild((obj) {
            obj..code = response.statusCode..status = (response.statusCode == HttpStatus.continue_ || response.statusCode == HttpStatus.ok);
            if(obj.status == true) {
              obj.data = JsonObject(response.data,);
            } else {
              obj.errors = JsonObject([(response.data as Map<String, dynamic>)['error']],);
            }
          });
          return response;
        },
      );
      ///CHECKING IF RESPONSE IS NULL
      if (result.data == null) {
        return Left(NetworkFailureError(type: NetworkFailureType.unknownException,),);
      }
      ///CHECKING IF RESPONSE IS SUCCESSFUL
      return Right(result.data!,);
    } on NetworkFailureError catch (failure) {
      ///HANDLING NETWORK FAILURE ERRORS
      return Left(failure,);
    }
  }
}