import 'package:flutter/material.dart';
import 'package:mum_health/generated/l10n.dart';
import 'package:stacked/stacked.dart';
import 'create_alarm_viewmodel.dart';

class CreateAlarmView extends StackedView<CreateAlarmViewModel> {
  const CreateAlarmView({super.key});

  @override
  Widget builder(BuildContext context, CreateAlarmViewModel viewModel, Widget? child) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  S.current.cancel,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.blueAccent),
                ),
              ),
              TextButton(
                onPressed: viewModel.saveAlarm,
                child: viewModel.isBusy
                    ? const CircularProgressIndicator()
                    : Text(
                  S.current.save,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
          Text(
            viewModel.getDay(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.blueAccent.withOpacity(0.8)),
          ),
          RawMaterialButton(
            onPressed: viewModel.pickTime,
            fillColor: Colors.grey[200],
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                TimeOfDay.fromDateTime(viewModel.selectedDateTime).format(context),
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.blueAccent),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.loopAlarmAudio,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                value: viewModel.loopAudio,
                onChanged: (value) => viewModel.loopAudio,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.vibrate,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                value: viewModel.vibrate,
                onChanged: (value) => viewModel.vibrate,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.showVolumeMax,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                value: viewModel.volumeMax,
                onChanged: (value) => viewModel.volumeMax,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.showNotification,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                value: viewModel.showNotification,
                onChanged: (value) => viewModel.showNotification,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.current.sound,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              DropdownButton(
                value: viewModel.assetAudio,
                items: const [
                  DropdownMenuItem<String>(
                    value: 'assets/marimba.mp3',
                    child: Text('Marimba'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'assets/nokia.mp3',
                    child: Text('Nokia'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'assets/mozart.mp3',
                    child: Text('Mozart'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'assets/star_wars.mp3',
                    child: Text('Star Wars'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'assets/one_piece.mp3',
                    child: Text('One Piece'),
                  ),
                ],
                onChanged: (value) => viewModel.assetAudio,
              ),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }



  @override
  CreateAlarmViewModel viewModelBuilder(BuildContext context) => CreateAlarmViewModel();

  @override
  void onViewModelReady(CreateAlarmViewModel viewModel) => viewModel.onReady();
}