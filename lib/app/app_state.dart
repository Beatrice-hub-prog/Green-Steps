// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AppState extends ChangeNotifier {
//   bool _isDarkMode = false;

//   bool get isDarkMode => _isDarkMode;

//   Future<void> loadFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     _isDarkMode = prefs.getBool('isDarkMode') ?? false;
//     notifyListeners();
//   }

//   Future<void> toggleTheme() async {
//     _isDarkMode = !_isDarkMode;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isDarkMode', _isDarkMode);
//     notifyListeners();
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppState extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ---------- Data Containers ----------
  List<Map<String, dynamic>> trackerEntries = [];
  List<String> joinedChallenges = [];
  List<Map<String, dynamic>> communityPosts = [];
  Map<String, dynamic> profile = {
    'name': 'Guest User',
    'email': '',
    'goal': 'Reduce footprint by 10% in 3 months'
  };

  // Subscriptions
  StreamSubscription<QuerySnapshot>? _communitySub;
  StreamSubscription<QuerySnapshot>? _trackerSub;
  StreamSubscription<QuerySnapshot>? _joinedChallengesSub;
  StreamSubscription<DocumentSnapshot>? _profileSub;

  AppState() {
    _initializeRealtime();
  }

  // ---------- Initialization ----------
  void _initializeRealtime() {
    // Listen to community posts
    _communitySub = _firestore
        .collection('community_posts')
        .orderBy('time', descending: true)
        .snapshots()
        .listen((snap) {
      communityPosts =
          snap.docs.map((d) => _normalizeDocData(d.data())).toList();
      notifyListeners();
    });

    _bindProfileListener();
    _bindTrackerListener();
    _bindChallengesListener();
  }

  Map<String, dynamic> _normalizeDocData(Map<String, dynamic> d) {
    final result = Map<String, dynamic>.from(d);
    if (result['time'] is Timestamp) {
      result['time'] = (result['time'] as Timestamp).toDate().toIso8601String();
    }
    if (result['date'] is Timestamp) {
      result['date'] = (result['date'] as Timestamp).toDate().toIso8601String();
    }
    return result;
  }

  // ---------- Firestore Listeners ----------
  void _bindProfileListener() {
    final userId = profile['name'] ?? 'Guest User';
    _profileSub?.cancel();
    _profileSub =
        _firestore.collection('users').doc(userId).snapshots().listen((doc) {
      if (doc.exists && doc.data() != null) {
        profile = _normalizeDocData(doc.data()!);
        _bindTrackerListener();
        _bindChallengesListener();
        notifyListeners();
      }
    });
  }

  void _bindTrackerListener() {
    final userId = profile['name'] ?? 'Guest User';
    _trackerSub?.cancel();
    _trackerSub = _firestore
        .collection('users')
        .doc(userId)
        .collection('tracker_entries')
        .orderBy('date', descending: true)
        .snapshots()
        .listen((snap) {
      trackerEntries =
          snap.docs.map((d) => _normalizeDocData(d.data())).toList();
      notifyListeners();
    });
  }

  void _bindChallengesListener() {
    final userId = profile['name'] ?? 'Guest User';
    _joinedChallengesSub?.cancel();
    _joinedChallengesSub = _firestore
        .collection('users')
        .doc(userId)
        .collection('joined_challenges')
        .snapshots()
        .listen((snap) {
      joinedChallenges = snap.docs.map((d) => d.id.toString()).toList();
      notifyListeners();
    });
  }

  // ---------- Firestore Actions ----------
  Future<void> addTrackerEntry(Map<String, dynamic> entry) async {
    final userId = profile['name'] ?? 'Guest User';
    final toSave = Map<String, dynamic>.from(entry);
    toSave['date'] = toSave['date'] ?? DateTime.now().toIso8601String();

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tracker_entries')
        .add(toSave);
  }

  Future<void> joinChallenge(String challengeId) async {
    final userId = profile['name'] ?? 'Guest User';
    if (joinedChallenges.contains(challengeId)) return;

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('joined_challenges')
        .doc(challengeId)
        .set({'joinedAt': DateTime.now().toIso8601String()});
  }

  Future<void> postToCommunity(String user, String text) async {
    final post = {
      'user': user,
      'text': text,
      'time': DateTime.now().toIso8601String(),
    };
    await _firestore.collection('community_posts').add(post);
  }

  Future<void> updateProfile(Map<String, dynamic> p) async {
    final oldUser = profile['name'] ?? 'Guest User';
    final newUser = p['name'] ?? oldUser;
    profile = Map<String, dynamic>.from(p);
    await _firestore.collection('users').doc(newUser).set(profile);
    if (newUser != oldUser) _bindProfileListener();
    notifyListeners();
  }

  // ---------- Utility ----------
  @override
  void dispose() {
    _communitySub?.cancel();
    _trackerSub?.cancel();
    _joinedChallengesSub?.cancel();
    _profileSub?.cancel();
    super.dispose();
  }
}
