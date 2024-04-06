import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:task_management_fares/common/primary_btn.dart';
import 'package:task_management_fares/core/app_assets.dart';

class FailureCard extends StatelessWidget {
  const FailureCard({
    super.key,
    this.label,
    this.isNoDataView = false,
    required this.onRetry,
    required this.colorButton,
  });

  final VoidCallback onRetry;
  final String? label;
  final bool isNoDataView;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isNoDataView ? AppAssets.noDataSvg : AppAssets.errorSvg,
            fit: BoxFit.cover,
            height: 160,
          ),
          const Gap(64),
          Text(
            label ??
                (isNoDataView
                    ? 'No Data Was Found'
                    : 'Error during fetch data'),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black),
          ),
          const Gap(8),
          PrimaryButton(
            backgroundColor: colorButton,
            onPressed: onRetry,
            hPadding: 32,
            vPadding: 8,
            labelStyle: Theme.of(context).textTheme.titleSmall,
            label: 'Refresh',
          ),
        ],
      ),
    );
  }
}
