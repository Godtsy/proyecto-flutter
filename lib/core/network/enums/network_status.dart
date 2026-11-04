enum NetworkStatus {
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internetServerError,
  connectTimeout,
  connectionError,
  receiveTimeout,
  sendTimeout,
  noInternetConnection,
  cancel,
  badCertificate,
  unknown,
  defaultError,
}

extension NetworkStatusParser on NetworkStatus {
  String toStatusKey() {
    switch (this) {
      case NetworkStatus.badRequest:
        return 'bad_response';
      case NetworkStatus.forbidden:
        return 'forbidden';
      case NetworkStatus.unauthorised:
        return 'unauthorised';
      case NetworkStatus.notFound:
        return 'not_found';
      case NetworkStatus.internetServerError:
        return 'internal_server_error';
      case NetworkStatus.connectTimeout:
        return 'connect_timeout';
      case NetworkStatus.connectionError:
        return 'connection_error';
      case NetworkStatus.receiveTimeout:
        return 'receive_timeout';
      case NetworkStatus.sendTimeout:
        return 'send_timeout';
      case NetworkStatus.noInternetConnection:
        return 'no_internet';
      case NetworkStatus.cancel:
        return 'request_cancel';
      case NetworkStatus.badCertificate:
        return 'bad_certificate';
      case NetworkStatus.unknown:
        return 'request_unknown';
      case NetworkStatus.defaultError:
        return 'generic_error';
    }
  }
}
