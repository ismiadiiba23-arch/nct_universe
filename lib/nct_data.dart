class Member {
  final String name;
  final String birthday;
  final String nationality;
  final String image;

  const Member({
    required this.name,
    required this.birthday,
    required this.nationality,
    required this.image,
  });
}

class Album {
  final String title;
  final String year;
  final String type;
  final String cover;

  const Album({
    required this.title,
    required this.year,
    required this.type,
    required this.cover,
  });
}

class Unit {
  final String name;
  final String tagline;
  final String description;
  final String debut;
  final String image;
  final List<Member> members;
  final List<Album> albums;

  const Unit({
    required this.name,
    required this.tagline,
    required this.description,
    required this.debut,
    required this.image,
    required this.members,
    required this.albums,
  });
}

// Semua foto diletakkan di assets/images/. Kalau file belum ada,
// aplikasi menampilkan placeholder (lihat widgets.dart).
const String _m = 'assets/images/members/';
const String _u = 'assets/images/units/';
const String _a = 'assets/images/albums/';

const List<Unit> units = [
  Unit(
    name: 'NCT 127',
    tagline: 'Neo City, Seoul',
    description:
        'Unit berbasis Seoul dengan konsep Neo City. Dikenal lewat musik '
        'yang eksperimental dan penampilan panggung yang kuat. Angka 127 '
        'berasal dari koordinat bujur Seoul.',
    debut: '2016',
    image: '${_u}nct127.jpeg',
    members: [
      Member(name: 'Taeyong', birthday: '1 Juli 1995', nationality: 'Korea Selatan', image: '${_m}taeyong.jpeg'),
      Member(name: 'Johnny', birthday: '9 Februari 1995', nationality: 'Amerika Serikat / Korea', image: '${_m}johnny.jpeg'),
      Member(name: 'Yuta', birthday: '26 Oktober 1995', nationality: 'Jepang', image: '${_m}yuta.jpeg'),
      Member(name: 'Doyoung', birthday: '1 Februari 1996', nationality: 'Korea Selatan', image: '${_m}doyoung.jpeg'),
      Member(name: 'Jaehyun', birthday: '14 Juni 1997', nationality: 'Korea Selatan', image: '${_m}jaehyun.jpeg'),
      Member(name: 'Jungwoo', birthday: '19 Februari 1998', nationality: 'Korea Selatan', image: '${_m}jungwoo.jpeg'),
      Member(name: 'Haechan', birthday: '6 Juni 2000', nationality: 'Korea Selatan', image: '${_m}haechan.jpeg'),
    ],
    albums: [
      Album(title: 'Neo Zone', year: '2020', type: 'Album Studio', cover: '${_a}neo_zone.jpeg'),
      Album(title: 'Sticker', year: '2021', type: 'Album Studio', cover: '${_a}sticker.jpeg'),
      Album(title: '2 Baddies', year: '2022', type: 'Album Studio', cover: '${_a}2_baddies.jpeg'),
      Album(title: 'Fact Check', year: '2023', type: 'Mini Album', cover: '${_a}fact_check.jpeg'),
    ],
  ),
  Unit(
    name: 'NCT DREAM',
    tagline: 'Never Cease Dreaming',
    description:
        'Unit dengan konsep remaja yang awalnya hanya beranggotakan member '
        'di bawah usia tertentu. Kini tampil dengan formasi enam orang '
        'dan energi yang cerah di setiap comeback.',
    debut: '2016',
    image: '${_u}nctdream.jpeg',
    members: [
      Member(name: 'Haechan', birthday: '6 Juni 2000', nationality: 'Korea Selatan', image: '${_m}haechan.jpeg'),
      Member(name: 'Renjun', birthday: '23 Maret 2000', nationality: 'Tiongkok', image: '${_m}renjun.jpeg'),
      Member(name: 'Jeno', birthday: '23 April 2000', nationality: 'Korea Selatan', image: '${_m}jeno.jpeg'),
      Member(name: 'Jaemin', birthday: '13 Agustus 2000', nationality: 'Korea Selatan', image: '${_m}jaemin.jpeg'),
      Member(name: 'Chenle', birthday: '22 November 2001', nationality: 'Tiongkok', image: '${_m}chenle.jpeg'),
      Member(name: 'Jisung', birthday: '5 Februari 2002', nationality: 'Korea Selatan', image: '${_m}jisung.jpeg'),
    ],
    albums: [
      Album(title: 'We Boom', year: '2019', type: 'Mini Album', cover: '${_a}we_boom.jpeg'),
      Album(title: 'Hot Sauce', year: '2021', type: 'Album Studio', cover: '${_a}hot_sauce.jpeg'),
      Album(title: 'Glitch Mode', year: '2022', type: 'Album Studio', cover: '${_a}glitch_mode.jpeg'),
      Album(title: 'ISTJ', year: '2023', type: 'Album Studio', cover: '${_a}istj.jpeg'),
    ],
  ),
  Unit(
    name: 'WayV',
    tagline: 'Way to Variety',
    description:
        'Unit berbasis Tiongkok dengan anggota dari berbagai negara '
        'Asia. Membawa musik dan koreografi yang tajam dalam bahasa '
        'Mandarin, Korea, dan Inggris.',
    debut: '2019',
    image: '${_u}wayv.jpeg',
    members: [
      Member(name: 'Kun', birthday: '1 Januari 1996', nationality: 'Tiongkok', image: '${_m}kun.jpeg'),
      Member(name: 'Ten', birthday: '27 Februari 1996', nationality: 'Thailand', image: '${_m}ten.jpeg'),
      Member(name: 'Xiaojun', birthday: '8 Agustus 1999', nationality: 'Tiongkok', image: '${_m}xiaojun.jpeg'),
      Member(name: 'Hendery', birthday: '28 September 1999', nationality: 'Makau / Tiongkok', image: '${_m}hendery.jpeg'),
      Member(name: 'Yangyang', birthday: '10 Oktober 2000', nationality: 'Taiwan', image: '${_m}yangyang.jpeg'),
    ],
    albums: [
      Album(title: 'Take Over the Moon', year: '2019', type: 'Mini Album', cover: '${_a}take_over_the_moon.jpeg'),
      Album(title: 'Kick Back', year: '2021', type: 'Mini Album', cover: '${_a}kick_back.jpeg'),
      Album(title: 'Phantom', year: '2023', type: 'Mini Album', cover: '${_a}phantom.jpeg'),
    ],
  ),
  Unit(
    name: 'NCT WISH',
    tagline: 'Wish for Everyone',
    description:
        'Unit generasi terbaru yang berawal dari proyek NCT Universe. '
        'Beranggotakan talenta Korea dan Jepang dengan konsep ceria '
        'dan fresh.',
    debut: '2024',
    image: '${_u}nctwish.jpeg',
    members: [
      Member(name: 'Sion', birthday: '21 Juni 2002', nationality: 'Korea Selatan', image: '${_m}sion.jpeg'),
      Member(name: 'Riku', birthday: '28 Juni 2004', nationality: 'Jepang', image: '${_m}riku.jpeg'),
      Member(name: 'Yushi', birthday: '28 September 2004', nationality: 'Jepang', image: '${_m}yushi.jpeg'),
      Member(name: 'Jaehee', birthday: '-', nationality: 'Korea Selatan', image: '${_m}jaehee.jpeg'),
      Member(name: 'Ryo', birthday: '-', nationality: 'Jepang', image: '${_m}ryo.jpeg'),
      Member(name: 'Sakuya', birthday: '-', nationality: 'Jepang', image: '${_m}sakuya.jpeg'),
    ],
    albums: [
      Album(title: 'WISH', year: '2024', type: 'Single Album', cover: '${_a}wish.jpeg'),
      Album(title: 'Steady', year: '2024', type: 'Mini Album', cover: '${_a}steady.jpeg'),
    ],
  ),
];
