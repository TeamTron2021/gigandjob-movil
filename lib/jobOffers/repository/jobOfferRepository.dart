import 'package:gigandjob_movil/jobOffers/api/jobOffer.api.dart';
import 'package:gigandjob_movil/jobOffers/model/jobOffer.model.dart';

abstract class JobOfferRepositoryBase {
  Future<List<JobOffer>> headline();
}

class JobOfferRepository extends JobOfferRepositoryBase {
  final JobOfferApiProvider _apiProvider;

  JobOfferRepository(this._apiProvider);

  @override 
  Future<List<JobOffer>> headline() async {
    final jobOfferRaw = await _apiProvider.headline();

    print('Repository\n');
    print(jobOfferRaw);

    final jobOffertoSend = jobOfferRaw.map((e) => JobOffer.fromJson(e)).toList();
    print('\nResultado\n');
    
    
    return jobOffertoSend;
  }


}