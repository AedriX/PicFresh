double avgRating(rating, int count) {
  double total = 0;
  double j = 1;
  for (int i = 0; i < count; i++) {
    double star = rating[i] * j;
    j = j + 1;
    total = total + star;
  }
  double avg = total / sumRating(rating, count);
  return avg;
}

double sumRating(rating, int count) {
  double sum = 0;
  for (int i = 0; i < count; i++) sum = sum + rating[i];
  return sum;
}
