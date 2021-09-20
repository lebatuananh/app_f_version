class Event {
  final String title, parent, image;
  final DateTime created_date;
  final int view_count;
  final bool favorite;

  Event(this.title, this.parent, this.image, this.created_date, this.view_count,
      this.favorite);
}
