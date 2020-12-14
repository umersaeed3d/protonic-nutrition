# Generated by Django 2.0.7 on 2020-05-21 19:38

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0008_orderdetails_price'),
    ]

    operations = [
        migrations.CreateModel(
            name='Mail',
            fields=[
                ('m_id', models.AutoField(primary_key=True, serialize=False)),
                ('subject', models.CharField(max_length=50)),
                ('body', models.CharField(max_length=50)),
                ('from_email', models.CharField(max_length=50)),
                ('to_email', models.CharField(max_length=50)),
            ],
        ),
        migrations.AlterField(
            model_name='order',
            name='date',
            field=models.DateField(default=datetime.date(2020, 5, 22)),
        ),
    ]
