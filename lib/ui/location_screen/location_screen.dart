
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lift/bloc/permission_bloc/permission_bloc.dart';
import 'package:lift/bloc/permission_bloc/permission_event.dart';

import '../../bloc/permission_bloc/permission_state.dart';
import '../ui.dart';

class PermissionsActivity extends StatelessWidget {
  const PermissionsActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permission Request'),
      ),
      body: BlocProvider(
        create: (context) => PermissionBloc()..add(LocationPermissionRequested()),
        child: BlocConsumer<PermissionBloc, PermissionState>(
          listener: (context, state) {
            if (state.isLocationPermissionGranted) {
              Navigator.pushNamed(context, routeName.mapScreen);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Location Permission Granted")),
              );
            } else if (state.isLocationPermissionDeniedOnce) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Location Permission Denied Once")),
              );
            } else if (state.isLocationPermissionDeniedForever) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Location Permission Permanently Denied")),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.location_on,
                      size: 80.0,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 12.0),
                    const Text(
                      'Permission Request',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 36.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Permission needs to access device location to provide required services. Please allow the permission',
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<PermissionBloc>()
                                  .add(LocationPermissionRequested());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Grant Permission',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
