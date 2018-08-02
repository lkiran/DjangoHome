# -*- coding: utf-8 -*-
# Generated by Django 1.11.14 on 2018-07-31 18:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='condition',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='condition',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='control',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='control',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='device',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='device',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='function',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='function',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='interface',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='interface',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='property',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='property',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='task',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='task',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
