json_data=$(jq -n  --rawfile fileContents ground_truth_python_v$PYTHON.txt --arg jobId "$jobId" --arg runId "$runId" '{data: { "key": ($runId + "/" + $jobId + "/" + "pip_ground_truth"), "fileContents": $fileContents}}')

echo "json_data : $json_data"

curl -X POST $BENCHMARKING_HARNESS_URL/rest/s3?version=2022-03-09~experimental -H 'Content-Type: application/vnd.api+json' -d "$json_data"
