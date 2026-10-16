// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_stack_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NavigationStackItem {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationStackItem);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NavigationStackItem()';
}


}

/// @nodoc
class $NavigationStackItemCopyWith<$Res>  {
$NavigationStackItemCopyWith(NavigationStackItem _, $Res Function(NavigationStackItem) __);
}


/// Adds pattern-matching-related methods to [NavigationStackItem].
extension NavigationStackItemPatterns on NavigationStackItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NavigationStackItemHome value)?  home,TResult Function( NavigationStackItemDetail value)?  detail,TResult Function( NavigationStackItemAddTransaction value)?  addTransaction,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NavigationStackItemHome() when home != null:
return home(_that);case NavigationStackItemDetail() when detail != null:
return detail(_that);case NavigationStackItemAddTransaction() when addTransaction != null:
return addTransaction(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NavigationStackItemHome value)  home,required TResult Function( NavigationStackItemDetail value)  detail,required TResult Function( NavigationStackItemAddTransaction value)  addTransaction,}){
final _that = this;
switch (_that) {
case NavigationStackItemHome():
return home(_that);case NavigationStackItemDetail():
return detail(_that);case NavigationStackItemAddTransaction():
return addTransaction(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NavigationStackItemHome value)?  home,TResult? Function( NavigationStackItemDetail value)?  detail,TResult? Function( NavigationStackItemAddTransaction value)?  addTransaction,}){
final _that = this;
switch (_that) {
case NavigationStackItemHome() when home != null:
return home(_that);case NavigationStackItemDetail() when detail != null:
return detail(_that);case NavigationStackItemAddTransaction() when addTransaction != null:
return addTransaction(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  home,TResult Function( Expense expense)?  detail,TResult Function( Expense? expense)?  addTransaction,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NavigationStackItemHome() when home != null:
return home();case NavigationStackItemDetail() when detail != null:
return detail(_that.expense);case NavigationStackItemAddTransaction() when addTransaction != null:
return addTransaction(_that.expense);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  home,required TResult Function( Expense expense)  detail,required TResult Function( Expense? expense)  addTransaction,}) {final _that = this;
switch (_that) {
case NavigationStackItemHome():
return home();case NavigationStackItemDetail():
return detail(_that.expense);case NavigationStackItemAddTransaction():
return addTransaction(_that.expense);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  home,TResult? Function( Expense expense)?  detail,TResult? Function( Expense? expense)?  addTransaction,}) {final _that = this;
switch (_that) {
case NavigationStackItemHome() when home != null:
return home();case NavigationStackItemDetail() when detail != null:
return detail(_that.expense);case NavigationStackItemAddTransaction() when addTransaction != null:
return addTransaction(_that.expense);case _:
  return null;

}
}

}

/// @nodoc


class NavigationStackItemHome implements NavigationStackItem {
  const NavigationStackItemHome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationStackItemHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NavigationStackItem.home()';
}


}




/// @nodoc


class NavigationStackItemDetail implements NavigationStackItem {
  const NavigationStackItemDetail({required this.expense});
  

 final  Expense expense;

/// Create a copy of NavigationStackItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationStackItemDetailCopyWith<NavigationStackItemDetail> get copyWith => _$NavigationStackItemDetailCopyWithImpl<NavigationStackItemDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationStackItemDetail&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,expense);

@override
String toString() {
  return 'NavigationStackItem.detail(expense: $expense)';
}


}

/// @nodoc
abstract mixin class $NavigationStackItemDetailCopyWith<$Res> implements $NavigationStackItemCopyWith<$Res> {
  factory $NavigationStackItemDetailCopyWith(NavigationStackItemDetail value, $Res Function(NavigationStackItemDetail) _then) = _$NavigationStackItemDetailCopyWithImpl;
@useResult
$Res call({
 Expense expense
});


$ExpenseCopyWith<$Res> get expense;

}
/// @nodoc
class _$NavigationStackItemDetailCopyWithImpl<$Res>
    implements $NavigationStackItemDetailCopyWith<$Res> {
  _$NavigationStackItemDetailCopyWithImpl(this._self, this._then);

  final NavigationStackItemDetail _self;
  final $Res Function(NavigationStackItemDetail) _then;

/// Create a copy of NavigationStackItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? expense = null,}) {
  return _then(NavigationStackItemDetail(
expense: null == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as Expense,
  ));
}

/// Create a copy of NavigationStackItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseCopyWith<$Res> get expense {
  
  return $ExpenseCopyWith<$Res>(_self.expense, (value) {
    return _then(_self.copyWith(expense: value));
  });
}
}

/// @nodoc


class NavigationStackItemAddTransaction implements NavigationStackItem {
  const NavigationStackItemAddTransaction({this.expense});
  

 final  Expense? expense;

/// Create a copy of NavigationStackItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NavigationStackItemAddTransactionCopyWith<NavigationStackItemAddTransaction> get copyWith => _$NavigationStackItemAddTransactionCopyWithImpl<NavigationStackItemAddTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NavigationStackItemAddTransaction&&(identical(other.expense, expense) || other.expense == expense));
}


@override
int get hashCode => Object.hash(runtimeType,expense);

@override
String toString() {
  return 'NavigationStackItem.addTransaction(expense: $expense)';
}


}

/// @nodoc
abstract mixin class $NavigationStackItemAddTransactionCopyWith<$Res> implements $NavigationStackItemCopyWith<$Res> {
  factory $NavigationStackItemAddTransactionCopyWith(NavigationStackItemAddTransaction value, $Res Function(NavigationStackItemAddTransaction) _then) = _$NavigationStackItemAddTransactionCopyWithImpl;
@useResult
$Res call({
 Expense? expense
});


$ExpenseCopyWith<$Res>? get expense;

}
/// @nodoc
class _$NavigationStackItemAddTransactionCopyWithImpl<$Res>
    implements $NavigationStackItemAddTransactionCopyWith<$Res> {
  _$NavigationStackItemAddTransactionCopyWithImpl(this._self, this._then);

  final NavigationStackItemAddTransaction _self;
  final $Res Function(NavigationStackItemAddTransaction) _then;

/// Create a copy of NavigationStackItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? expense = freezed,}) {
  return _then(NavigationStackItemAddTransaction(
expense: freezed == expense ? _self.expense : expense // ignore: cast_nullable_to_non_nullable
as Expense?,
  ));
}

/// Create a copy of NavigationStackItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExpenseCopyWith<$Res>? get expense {
    if (_self.expense == null) {
    return null;
  }

  return $ExpenseCopyWith<$Res>(_self.expense!, (value) {
    return _then(_self.copyWith(expense: value));
  });
}
}

// dart format on
