#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

void generate(double *x) {
    srand(time(NULL));
    *x = (double)(rand() % 10000) / 100;
}

void print(const double *x, const double *res) {
    printf("sin(%lf) ~= %lf.\n", *x, *res);         // Сообщение вывода
}

void getAns(double x, double *res) {
    int k = (int)(x / (2 * M_PI));                        // Приводим к значению от 0 до 2 * Pi
    if (k >= 0) {
        x = x - 2 * M_PI * k;
    } else {
        x = x + 2 * (M_PI * -k + 1);
    }
    *res = x;
    double cur_num = x;                                   // Текущий член степенного ряда
    int i = 1;
    while (cur_num > 1e-7 || cur_num < -1e-7) {            // Обновляем результат, если изменения все еще > точности
        cur_num *= -1;
        cur_num *= x * x;                                // Числитель (-1)^n * x^(2n + 1)
        cur_num /= (2 * i) * (2 * i + 1);                  // Знаменатель (2n + 1)!
        ++i;
        *res += cur_num;
    }
}

int main() {
    double x;
    double res;
    generate(&x);
    getAns(x, &res);
    print(&x, &res);
}
