# Agents Of Valorant

Valorant agents info app.

---


## Progress Screenshot
![output](https://user-images.githubusercontent.com/35481593/180747923-289b7204-ec2e-4951-b974-b2eeff697c1a.gif)

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Agents Of Valorant works on iOS, Android, Web, and Windows._

---

## Output Build command

```sh

$ flutter build apk --split-per-abi --flavor development --target lib/main_development.dart

```
