
### To investigate the current behavior

With the implementation of using `ActionsBloc`, in the homepage:

- clicking 'Refresh' top-right icon:
```
flutter: 2019-02-16 21:48:12.460771 [ActionsDbProvider] fetchActions > 0 rows.
flutter: 2019-02-16 21:48:12.461478 [ActionsBloc] _fetchAllActions > Got 0 actions from repo.
flutter: 2019-02-16 21:48:12.467514 [ActionsList] _buildBody > 0 actions provided.
flutter: 2019-02-16 21:48:12.618237 [ActionsList] _buildBody > 0 actions provided.
```

- subsequent clicks on 'Refresh' top-right icon shows:
```
flutter: 2019-02-12 22:54:50.735532 [ActionsList] _buildBody > 0 actions provided.
flutter: 2019-02-12 22:54:50.744331 [ActionsDbProvider] fetchActions > 0 rows.
flutter: 2019-02-12 22:54:50.747685 [ActionsBloc] _fetchAllActions > Got 0 actions from repo.
flutter: 2019-02-12 22:54:50.756224 [ActionsList] _buildBody > 0 actions provided.
flutter: 2019-02-12 22:54:50.932807 [ActionsList] _buildBody > 0 actions provided.
```

#### 2019-02-16 | Using 'flutter_bloc' package

Evaluating it in a new branch named 'eval___flutter_bloc'.
