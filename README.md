
#

## preparation

Checkout the code, build or pull the image.

```
git clone
```

```
docker build -t huguesfontenelle/ubuntu-with-entrypoint .
```
or
```
docker pull huguesfontenelle/ubuntu-with-entrypoint
```


## local

### no ENTRYPOINT defined

```
nextflow  \
  run main.nf \
  -profile default_image \
  -work-dir "./work" \
  --outDir "./Results"
```

SUCCESS


### ENTRYPOINT defined

```
nextflow  \
  -trace nextflow.cloud.google.pipelines \
  run main.nf \
  -profile entrypoint_image \
  -work-dir "./work" \
  --outDir "./Results"
```

SUCCESS


## Google-genomics

Authenticate to GCP with your credentials and project ID.
```
export NXF_MODE=google
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcp/auth.json"
export GCP_PROJECT="my-gcp-project"
gcloud auth activate-service-account --key-file ${GOOGLE_APPLICATION_CREDENTIALS}
gcloud --quiet config set project ${GCP_PROJECT}
gcloud auth configure-docker
```

### no ENTRYPOINT defined
```
nextflow  \
  -trace nextflow.cloud.google.pipelines \
  run main.nf \
  -profile gcp,default_image \
  -work-dir "gs://ngs-workdir/work" \
  --outDir "gs://ngs-workdir/Results"
```

SUCCESS

### ENTRYPOINT defined
```
nextflow  \
  -trace nextflow.cloud.google.pipelines \
  run main.nf \
  -profile gcp,entrypoint_image \
  -work-dir "gs://ngs-workdir/work" \
  --outDir "gs://ngs-workdir/Results"
```

FAIL

Logs in .nextflow.log
