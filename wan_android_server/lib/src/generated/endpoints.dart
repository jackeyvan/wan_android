/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/banner_endpoint.dart' as _i2;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'banner': _i2.BannerEndpoint()
        ..initialize(
          server,
          'banner',
          null,
        )
    };
    connectors['banner'] = _i1.EndpointConnector(
      name: 'banner',
      endpoint: endpoints['banner']!,
      methodConnectors: {
        'fetchBanner': _i1.MethodConnector(
          name: 'fetchBanner',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['banner'] as _i2.BannerEndpoint).fetchBanner(session),
        ),
        'insertBanner': _i1.MethodConnector(
          name: 'insertBanner',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['banner'] as _i2.BannerEndpoint).insertBanner(session),
        ),
      },
    );
  }
}
