# Generated by Django 4.2.7 on 2024-01-26 07:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0010_organization_multi_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organizationgoal',
            name='description',
            field=models.TextField(max_length=150),
        ),
        migrations.AlterField(
            model_name='organizationnews',
            name='description',
            field=models.TextField(max_length=150),
        ),
        migrations.AlterField(
            model_name='organizationstories',
            name='description',
            field=models.TextField(max_length=150),
        ),
    ]