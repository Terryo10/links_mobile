part of 'subscription_bloc.dart';

@immutable
abstract class SubscriptionState {}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionPriceLoadingState extends SubscriptionState{}

class SubscriptionPriceLoadedState extends SubscriptionState{
  final PriceModel? priceModel;

  SubscriptionPriceLoadedState({@required this.priceModel});
}

class SubscriptionPayingState extends SubscriptionState{}
class SubscriptionPaidState extends SubscriptionState{}
