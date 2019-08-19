import 'package:smartters_studio_admin_ui/pojos/blog.dart';
import 'package:smartters_studio_admin_ui/pojos/contact.dart';
import 'package:smartters_studio_admin_ui/pojos/gallery.dart';
import 'package:smartters_studio_admin_ui/pojos/project.dart';
import 'package:smartters_studio_admin_ui/pojos/statistics.dart';
import 'package:smartters_studio_admin_ui/pojos/subscriber.dart';
import 'package:smartters_studio_admin_ui/pojos/team.dart';

Future<Statistics> getStatistics() async {
  return Future<Statistics>.value(
      Statistics(blog: 2, contact: 2, member: 2, subscriber: 2));
}

Future<SubscriberList> getSubscribers() async {
  return Future<SubscriberList>.value(SubscriberList(data: [
    Subscriber(
        ip: '127.0.01',
        timestamp: DateTime.now(),
        email: 'skmuduli17@gmail.com',
        id: 1),
    Subscriber(
        ip: '127.0.01',
        timestamp: DateTime.now(),
        email: 'skmuduli17@gmail.com',
        id: 2),
    Subscriber(
        ip: '127.0.01',
        timestamp: DateTime.now(),
        email: 'skmuduli17@gmail.com',
        id: 3),
    Subscriber(
        ip: '127.0.01',
        timestamp: DateTime.now(),
        email: 'skmuduli17@gmail.com',
        id: 4),
    Subscriber(
        ip: '127.0.01',
        timestamp: DateTime.now(),
        email: 'skmuduli17@gmail.com',
        id: 5),
  ]));
}

Future<ContactList> getContacts() async {
  return Future<ContactList>.value(ContactList(data: [
    Contact(
        id: 1,
        name: 'Sunil',
        subject: 'Nice work',
        message: 'Demo message',
        email: 'skmuduli17@gmail.com',
        timestamp: DateTime.now(),
        ip: '127.0.01'),
    Contact(
        id: 2,
        name: 'Sunil',
        subject: 'Nice work',
        message: 'Demo message',
        email: 'skmuduli17@gmail.com',
        timestamp: DateTime.now(),
        ip: '127.0.01'),
    Contact(
        id: 3,
        name: 'Sunil',
        subject: 'Nice work',
        message: 'Demo message',
        email: 'skmuduli17@gmail.com',
        timestamp: DateTime.now(),
        ip: '127.0.01'),
    Contact(
        id: 4,
        name: 'Sunil',
        subject: 'Nice work',
        message: 'Demo message',
        email: 'skmuduli17@gmail.com',
        timestamp: DateTime.now(),
        ip: '127.0.01'),
    Contact(
        id: 5,
        name: 'Sunil',
        subject: 'Nice work',
        message: 'Demo message',
        email: 'skmuduli17@gmail.com',
        timestamp: DateTime.now(),
        ip: '127.0.01'),
  ]));
}

Future<Projects> getProjects() async {
  return Future<Projects>.value(Projects(data: [
    Project(
        id: 1,
        timestamp: DateTime.now(),
        name: 'Sunil',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        description: 'Android project',
        link: 'www.google.com',
        endTime: DateTime.now(),
        startTime: DateTime.now(),
        techUsed: 'Android'),
    Project(
        id: 2,
        timestamp: DateTime.now(),
        name: 'Sunil',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        description: 'Android project',
        link: 'www.google.com',
        endTime: DateTime.now(),
        startTime: DateTime.now(),
        techUsed: 'Android'),
    Project(
        id: 3,
        timestamp: DateTime.now(),
        name: 'Sunil',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        description: 'Android project',
        link: 'www.google.com',
        endTime: DateTime.now(),
        startTime: DateTime.now(),
        techUsed: 'Android'),
    Project(
        id: 4,
        timestamp: DateTime.now(),
        name: 'Sunil',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        description: 'Android project',
        link: 'www.google.com',
        endTime: DateTime.now(),
        startTime: DateTime.now(),
        techUsed: 'Android'),
    Project(
        id: 5,
        timestamp: DateTime.now(),
        name: 'Sunil',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        description: 'Android project',
        link: 'www.google.com',
        endTime: DateTime.now(),
        startTime: DateTime.now(),
        techUsed: 'Android'),
  ]));
}

Future<Teams> getTeamMembers() async {
  return Future<Teams>.value(Teams(data: [
    TeamMember(
        name: 'Sunil kumar',
        id: 1,
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        designation: 'Flutter developer',
        fbLink: 'www.facebook.com',
        githubLink: 'www.github.com',
        instaLink: '',
        linkedinLink: '',
        timestamp: DateTime.now()),
    TeamMember(
        name: 'Sunil kumar',
        id: 1,
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        designation: 'Flutter developer',
        fbLink: 'www.facebook.com',
        githubLink: 'www.github.com',
        instaLink: '',
        linkedinLink: '',
        timestamp: DateTime.now()),
    TeamMember(
        name: 'Sunil kumar',
        id: 1,
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        designation: 'Flutter developer',
        fbLink: 'www.facebook.com',
        githubLink: 'www.github.com',
        instaLink: '',
        linkedinLink: '',
        timestamp: DateTime.now()),
  ]));
}

Future<Blogs> getBlogs() async {
  return Future<Blogs>.value(Blogs(data: [
    Blog(
        id: 1,
        title: 'Loreum',
        description: 'Loreum',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        timestamp: DateTime.now(),
        blogLink: 'www.google.com'),
    Blog(
        id: 2,
        title: 'Loreum',
        description: 'Loreum',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        timestamp: DateTime.now(),
        blogLink: 'www.google.com'),
    Blog(
        id: 3,
        title: 'Loreum',
        description: 'Loreum',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        timestamp: DateTime.now(),
        blogLink: 'www.google.com'),
    Blog(
        id: 4,
        title: 'Loreum',
        description: 'Loreum',
        photo:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg',
        timestamp: DateTime.now(),
        blogLink: 'www.google.com'),
  ]));
}

Future<List<Gallery>> getPhotos() async {
  return Future<List<Gallery>>.value([
    Gallery(
        id: '1',
        time: 'a',
        name:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg'),
    Gallery(
        id: '2',
        time: 'a',
        name:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg'),
    Gallery(
        id: '3',
        time: 'a',
        name:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg'),
    Gallery(
        id: '4',
        time: 'a',
        name:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg'),
    Gallery(
        id: '5',
        time: 'a',
        name:
            'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?cs=srgb&dl=arches-architecture-building-1007431.jpg&fm=jpg'),
  ]);
}
