import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:imtohon_4/features/presentation/widgets/error_page.dart';

import '../../assets/colors.dart';
import '../../assets/icons.dart';
import 'bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.status == LoadingStatus.pure) {
              context.read<WeatherBloc>().add(WeatherEventStarted());
              return const SizedBox();
            } else if (state.status == LoadingStatus.failure) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ErrorScreen()));
            } else if (state.status == LoadingStatus.loading) {
              return const Center(child: CupertinoActivityIndicator());
            }
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/fon.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                  child: Container(
                height: 321,
                width: 325,
                decoration: BoxDecoration(
                  color: snowyColor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Column(
                  children: [
                    Gap(15.5),
                    Text('${state.weatherEntity?.location.localtime}', style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),),
                    Row(children: [
                      SvgPicture.asset(AppIcons.cloudy),
                    ],),
                    Text("${state.weatherEntity?.location.region}"),
                  ],
                ),
              )),
            );
          },
        ),
      );
    });
  }
}

// Text("${state.weatherEntity?.location.region}")
