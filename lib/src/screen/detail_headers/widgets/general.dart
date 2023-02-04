import 'package:flutter/material.dart';

class GeneralWidget extends StatefulWidget {
  const GeneralWidget({
    super.key,
    this.requestUrl,
    this.requestMethod,
    this.responseStatusCode,
    this.responseReasonPhrase,
    this.message,
    this.requestRemoteAddress,
    this.requestReferrerPolicy,
  });

  final String? requestUrl;
  final String? requestMethod;
  final int? responseStatusCode;
  final String? responseReasonPhrase;
  final String? message;
  final String? requestRemoteAddress;
  final String? requestReferrerPolicy;

  @override
  State<GeneralWidget> createState() => _GeneralWidgetState();
}

class _GeneralWidgetState extends State<GeneralWidget> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          child: _GeneralTitle(title: 'General', isVisible: _isVisible),
          onTap: () => setState(() => _isVisible = !_isVisible),
        ),
        Visibility(
          visible: _isVisible,
          child: _GeneralBody(
            requestUrl: widget.requestUrl,
            requestMethod: widget.requestMethod,
            responseStatusCode: widget.responseStatusCode,
            responseReasonPhrase: widget.responseReasonPhrase,
            message: widget.message,
            requestRemoteAddress: widget.requestRemoteAddress,
            requestReferrerPolicy: widget.requestReferrerPolicy,
          ),
        )
      ],
    );
  }
}

class _GeneralTitle extends StatelessWidget {
  final String title;
  final bool isVisible;

  const _GeneralTitle({required this.title, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Icon(
            isVisible
                ? Icons.keyboard_arrow_down_sharp
                : Icons.keyboard_arrow_up_sharp,
          ),
        ],
      ),
    );
  }
}

class _GeneralBody extends StatelessWidget {
  final String? requestUrl;
  final String? requestMethod;
  final int? responseStatusCode;
  final String? responseReasonPhrase;
  final String? message;
  final String? requestRemoteAddress;
  final String? requestReferrerPolicy;

  const _GeneralBody({
    this.requestUrl,
    this.requestMethod,
    this.responseStatusCode,
    this.responseReasonPhrase,
    this.message,
    this.requestRemoteAddress,
    this.requestReferrerPolicy,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GeneralItemTile(title: 'Request URL', value: requestUrl),
          _GeneralItemTile(title: 'Request Method', value: requestMethod),
          _GeneralItemTile(
            title: 'Status Code',
            value: responseStatusCode?.toString(),
          ),
          _GeneralItemTile(title: 'Reason Phrase', value: responseReasonPhrase),
          // TODO: add remote address and referrer policy
          _GeneralItemTile(title: 'Message', value: message),
        ],
      ),
    );
  }
}

class _GeneralItemTile extends StatelessWidget {
  final String title;
  final String? value;

  const _GeneralItemTile({required this.title, this.value});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: DefaultTextStyle.of(context).style.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
        children: <TextSpan>[
          TextSpan(
            text: value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: value == null ? Colors.black54 : Colors.black,
              height: 1.25,
              fontStyle: value == null ? FontStyle.italic : null,
            ),
          ),
        ],
      ),
    );
  }
}
