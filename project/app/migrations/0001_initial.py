# Generated by Django 4.2.5 on 2023-11-09 11:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('job_title', models.CharField(max_length=200)),
                ('description', models.TextField()),
                ('description2', models.TextField()),
                ('description3', models.TextField(default=0)),
                ('description4', models.TextField(default=0)),
                ('description5', models.TextField(default=0)),
                ('description6', models.TextField(default=0)),
                ('description7', models.TextField(default=0)),
                ('image', models.ImageField(upload_to='static/images')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.category')),
            ],
        ),
    ]
