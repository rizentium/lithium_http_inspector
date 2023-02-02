import 'package:flutter/material.dart';

import '../../data/http_interface.dart';

class ItemTile extends StatelessWidget {
  final HttpInterface request;

  const ItemTile({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 4.0,
                children: [
                  Text(
                    request.request.method,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(request.request.uri?.path ?? 'Path not found'),
                ],
              ),
              const SizedBox(height: 4),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4.0,
                children: [
                  _OriginWidget(scheme: request.request.uri?.scheme),
                  Text(
                    request.request.uri?.origin ?? 'Origin not found',
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          _StatusWidget(status: request.response.status ?? ''),
        ],
      ),
    );
  }
}

class _OriginWidget extends StatelessWidget {
  final bool _isSecured;

  const _OriginWidget({String? scheme}) : _isSecured = scheme == 'https';
  @override
  Widget build(BuildContext context) {
    return Icon(
      _isSecured ? Icons.lock : Icons.no_encryption,
      color: _isSecured ? Colors.green : Colors.red,
      size: 12,
    );
  }
}

class _StatusWidget extends StatelessWidget {
  final String status;

  const _StatusWidget({required this.status});

  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: const TextStyle(
        color: Colors.red,
      ),
    );
  }
}
