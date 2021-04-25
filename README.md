# README

## Create short URL

```
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"url":"http://test.com"}' \
  http://localhost:3000/urls
```

## Get full URL
```
curl http://localhost:3000/urls/[short_part_here]
```

## Get stat
```
curl http://localhost:3000/urls/[short_part_here]/stats
```
