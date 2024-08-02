/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:wan_android_shared/src/api_response.dart' as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointBanner extends _i1.EndpointRef {
  EndpointBanner(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'banner';

  _i2.Future<_i3.ApiResponse> fetchBanner() =>
      caller.callServerEndpoint<_i3.ApiResponse>(
        'banner',
        'fetchBanner',
        {},
      );

  _i2.Future<_i3.ApiResponse> insertBanner() =>
      caller.callServerEndpoint<_i3.ApiResponse>(
        'banner',
        'insertBanner',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    banner = EndpointBanner(this);
  }

  late final EndpointBanner banner;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'banner': banner};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
