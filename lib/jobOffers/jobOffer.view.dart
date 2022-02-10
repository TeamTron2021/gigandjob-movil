import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/jobOffers/api/jobOffer.api.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferBloc.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferEvents.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferStatus.dart';
import 'package:gigandjob_movil/jobOffers/repository/jobOfferRepository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'model/jobOffer.model.dart';

class JobOfferView extends StatelessWidget {
  JobOfferView({Key? key}) : super(key: key);
  
  @override
  Widget create(BuildContext context) {
    final provider = JobOfferApiProvider();
    final repository = JobOfferRepository(provider);
    return BlocProvider(create:  (context) => JobOfferBloc(repository: repository),
    child: JobOfferView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobOffer'),
      ),
      body: BlocBuilder<JobOfferBloc, JobOfferState>(
        builder: (context, state) {
          if (state is JobOffersComplete) {
            return ListView.builder(
              itemCount: state.jobOffer.length,
              itemBuilder: (context, int index)
                => _ListItemJobOffer(jobOffer: state.jobOffer[index])
            );
          } else if (state is JobOfferError) {
            return Text(state.error);
          }
          else {
             return Center(
              child: CircularProgressIndicator()
              );
          }
        },
      )
    );

  }
}

class _ListItemJobOffer extends StatelessWidget {
  final JobOffer jobOffer;

  const _ListItemJobOffer({
    Key? key,
    required this.jobOffer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [

            Text(
              '${jobOffer.title}',
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('${jobOffer.description}', maxLines: 3),
            SizedBox(height: 16),
          ],
        ),
      );
  }
}

// class JobOfferListItem extends StatefulWidget {
//   JobOfferListItem({Key? key}) : super(key: key);

//   @override
//   State<JobOfferListItem> createState() => _JobOfferListItemState();
// }

// class _JobOfferListItemState extends State<JobOfferListItem> {
//   final JobOfferApiProvider _apiProvider = JobOfferApiProvider();
//   late final JobOfferRepository repository;
//   late final JobOfferBloc _bloc;
//   final PagingController<int, JobOffer> _pagingController = PagingController(firstPageKey:  0);
//   late StreamSubscription _blocListingStateSubscription;

//   _JobOfferListItemState({Key? key,}) {
//     repository = JobOfferRepository(_apiProvider);
//     _bloc = JobOfferBloc(repository: repository);
//   }

//    @override
//   void initState() {
//     _pagingController.addPageRequestListener((pageKey) {
//       // _bloc.on(context).add(pageKey);
//     });

//     _blocListingStateSubscription = 
//       _bloc.onNewList
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
