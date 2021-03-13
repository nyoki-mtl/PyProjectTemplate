# PyProjectTemplate

## Install

### Docker
COMMANDに実行コマンドをexportして，`make docker-run`でdocker上で実行できる


```bash
$ export COMMAND="python tools/env_test.py"
$ make docker-run
```

### ローカル
想定環境はUbuntu18.04 + cuda10.2

```bash
$ conda env create -f env_name.yml
$ conda activate python3.7
$ python setup.py develop
```

環境の書き出しは

```bash
$ conda env export -n python3.7 -f env_name.yml 
```
