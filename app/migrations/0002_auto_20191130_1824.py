# -*- coding: utf-8 -*-
# Generated by Django 1.11.26 on 2019-11-30 18:24
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='category',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='category',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='condition',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='control',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='control',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='device',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='device',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='function',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='function',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='group',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='group',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='group',
            name='ParentGroup',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='app.Group'),
        ),
        migrations.AlterField(
            model_name='interface',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='interface',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='prefab',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='prefab',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='property',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='property',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='task',
            name='CreatedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='task',
            name='ModifiedOn',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
