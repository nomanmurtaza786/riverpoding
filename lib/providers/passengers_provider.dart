import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:superwizor/models/passengers_model.dart';
import 'package:superwizor/providers/providers.dart';

part 'passengers_provider.g.dart';

@riverpod
class PassengersApi extends _$PassengersApi {
  @override
  FutureOr<List<Passenger>> build() async {
    final data = await ref.watch(apiServicesProvider).getPassengers();
    //final Totalpages = data.totalPages;
    final passengers = data.data ?? [];
    return passengers;
  }

  //load more
  Future<void> loadMore() async {
    state = const AsyncLoading();
    final data = await ref.watch(apiServicesProvider).getPassengers(page: 1);
    final passengers = data.data ?? [];
    final oldData = state.value ?? [];
    state = AsyncData(oldData + passengers);
  }
}

@riverpod
Future<List<Passenger>> fetchPassengers(FetchPassengersRef ref,
    {int page = 0}) async {
  if (page > 10) {
    return [];
  }
  final data = await ref.watch(apiServicesProvider).getPassengers(page: page);
  //final Totalpages = data.totalPages;
  final passengers = data.data ?? [];
  //timer to refresh the data

  //ref.cacheFor(const Duration(minutes: 5));

  return passengers;
}
