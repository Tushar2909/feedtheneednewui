import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils/httpclient.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.get('/notification'),
      builder: (context, AsyncSnapshot<Response<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Row(
              children: [
                Icon(Icons.error),
                Text(
                  "ERROR",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          );
        }

        assert(snapshot.hasData);
        final data = snapshot.data!.data as List<dynamic>;

        return ListView.separated(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (ctx, idx) => ListTile(
            onTap: () {
              _launchUrl(data[idx]["latitude"], data[idx]["longitude"]);
            },
            title: Text(data[idx]["foodDetail"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Text(data[idx]["email"]),
                const SizedBox(height: 8),
                Text(data[idx]["mobileno"]),
                const SizedBox(height: 8),
                Text(data[idx]["address"] + ", " + data[idx]["userlocation"]),
              ],
            ),
          ),
          separatorBuilder: (ctx, idx) => Divider(
            height: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }

  void _launchUrl(lat, lng) async {
    final _url =
        'https://www.google.com/maps/dir/?api=1&destination=${lat},${lng}';

    if (!await launchUrl(Uri.parse(_url))) throw 'Could not launch $_url';
  }
}
