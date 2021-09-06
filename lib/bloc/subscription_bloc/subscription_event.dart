part of 'subscription_bloc.dart';

@immutable
abstract class SubscriptionEvent {}

class GetPriceEvent extends SubscriptionEvent{}