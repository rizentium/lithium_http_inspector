import 'package:flutter/material.dart';

import '../../../../data/http_interface.dart';

class BodyItemTile extends StatelessWidget {
  final HttpResponseInterface response;
  final void Function()? onTap;

  const BodyItemTile({super.key, required this.response, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                      response.request.method,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(response.request.uri?.path ?? 'Path not found'),
                  ],
                ),
                const SizedBox(height: 4),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 4.0,
                  children: [
                    _OriginWidget(scheme: response.request.uri?.scheme),
                    Text(
                      response.request.uri?.origin ?? 'Origin not found',
                      style: const TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            _StatusWidget(
              status: response.statusCode?.toString() ?? response.reasonPhrase,
            ),
          ],
        ),
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
  final String? status;

  const _StatusWidget({required this.status});

  @override
  Widget build(BuildContext context) {
    return Text(
      status ?? '',
      style: TextStyle(
        color: _statusColor,
      ),
    );
  }

  Color get _statusColor {
    final parsed = int.tryParse(status ?? '') ?? 0;

    if (parsed >= 200 && parsed < 300) {
      return Colors.green;
    }
    return Colors.red;
  }
}
