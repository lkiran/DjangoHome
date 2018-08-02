# -*- coding: utf-8 -*-
# Generated by Django 1.11.14 on 2018-07-28 19:52
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion
import jsonfield.fields
import shortuuidfield.fields


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Condition',
            fields=[
                ('Id', shortuuidfield.fields.ShortUUIDField(blank=True, editable=False, max_length=22, primary_key=True, serialize=False, unique=True)),
                ('Operator', models.IntegerField(choices=[(0, b'Equal'), (1, b'Not Equal'), (2, b'Greater'), (3, b'Smaller')])),
                ('Value', models.CharField(max_length=50)),
                ('AndConditions', models.ManyToManyField(blank=True, to='app.Condition')),
            ],
        ),
        migrations.CreateModel(
            name='Control',
            fields=[
                ('Id', shortuuidfield.fields.ShortUUIDField(blank=True, editable=False, max_length=22, primary_key=True, serialize=False, unique=True)),
                ('Name', models.CharField(max_length=50)),
                ('Conditions', models.ManyToManyField(blank=True, to='app.Condition')),
            ],
        ),
        migrations.CreateModel(
            name='Device',
            fields=[
                ('Id', shortuuidfield.fields.ShortUUIDField(blank=True, editable=False, max_length=22, primary_key=True, serialize=False, unique=True)),
                ('Name', models.CharField(max_length=50)),
                ('CallClass', models.CharField(max_length=50)),
                ('Parameters', jsonfield.fields.JSONField(default=b'{}')),
            ],
        ),
        migrations.CreateModel(
            name='Function',
            fields=[
                ('Id', shortuuidfield.fields.ShortUUIDField(blank=True, editable=False, max_length=22, primary_key=True, serialize=False, unique=True)),
                ('Name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Interface',
            fields=[
                ('Id', shortuuidfield.fields.ShortUUIDField(blank=True, editable=False, max_length=22, primary_key=True, serialize=False, unique=True)),
                ('Name', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Prefab',
            fields=[
                ('Id', shortuuidfield.fields.ShortUUIDField(blank=True, editable=False, max_length=22, primary_key=True, serialize=False, unique=True)),
                ('Name', models.CharField(max_length=50)),
                ('Template', jsonfield.fields.JSONField(default=b'{}')),
            ],
        ),
        migrations.CreateModel(
            name='Property',
            fields=[
                ('Id', shortuuidfield.fields.ShortUUIDField(blank=True, editable=False, max_length=22, primary_key=True, serialize=False, unique=True)),
                ('Name', models.CharField(max_length=50)),
                ('CallFunction', models.CharField(max_length=50)),
                ('Parameters', jsonfield.fields.JSONField(default=b'{}')),
                ('Value', models.CharField(max_length=50)),
                ('Type', models.IntegerField(choices=[(0, b'Error'), (1, b'Read Only'), (2, b'Write Only'), (3, b'Read Or Write')])),
                ('Class', models.IntegerField(choices=[(0, b'Error'), (1, b'Integer'), (2, b'String'), (3, b'Boolean'), (4, b'Color'), (5, b'DayOfWeek'), (6, b'Date'), (7, b'Time'), (8, b'Empty'), (9, b'DateTime')])),
                ('Comparable', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='Task',
            fields=[
                ('Id', shortuuidfield.fields.ShortUUIDField(blank=True, editable=False, max_length=22, primary_key=True, serialize=False, unique=True)),
                ('Value', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='PropertyInfo',
            fields=[
                ('property_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='app.Property')),
            ],
            bases=('app.property',),
        ),
        migrations.AddField(
            model_name='task',
            name='Property',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='app.Property'),
        ),
        migrations.AddField(
            model_name='interface',
            name='Editor',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='editor', to='app.Property'),
        ),
        migrations.AddField(
            model_name='interface',
            name='Monitor',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='app.Property'),
        ),
        migrations.AddField(
            model_name='function',
            name='Properties',
            field=models.ManyToManyField(blank=True, to='app.Property'),
        ),
        migrations.AddField(
            model_name='device',
            name='Functions',
            field=models.ManyToManyField(blank=True, to='app.Function'),
        ),
        migrations.AddField(
            model_name='control',
            name='Tasks',
            field=models.ManyToManyField(blank=True, to='app.Task'),
        ),
        migrations.AddField(
            model_name='condition',
            name='Property',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, to='app.Property'),
        ),
    ]
