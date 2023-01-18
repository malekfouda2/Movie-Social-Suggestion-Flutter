import '../models/userModel.dart';
import '../controllers/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StreamProvider<List<User>>(
    (ref) => ref.read(userServiceProvider).userStream);
