"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv

PATH = './north_data/customers_data.csv'


def add_data_to_customers(path='./north_data/customers_data.csv'):
    with open(path, 'r') as file:
        csv_content = csv.reader(file, delimiter=',')
        content = []
        for i in csv_content:
            content.append(i)
        conn = psycopg2.connect(host='127.0.0.1',
                                database='north',
                                user='postgres',
                                password='qwerty')
        cur = conn.cursor()

        cur.executemany("INSERT INTO customers VALUES(%s,%s,%s)", content[1:])
        conn.commit()
        conn.close()


def add_data_to_employees(path='./north_data/employees_data.csv'):
    with open(path, 'r') as file:
        csv_content = csv.reader(file, delimiter=',')
        content = []
        for i in csv_content:
            content.append(i)
        conn = psycopg2.connect(host='127.0.0.1',
                                database='north',
                                user='postgres',
                                password='qwerty')
        cur = conn.cursor()

        cur.executemany("INSERT INTO employees VALUES(%s,%s,%s,%s,%s)", content[1:])
        conn.commit()
        conn.close()
