#!/bin/bash

BASE_DIR=$(pwd)

git remote remove origin 2>/dev/null
git remote add origin https://github.com/holygrail11/practice_projeccts.git
git checkout -b main 2>/dev/null || git checkout main

declare -A COMMIT_DATES=(
  ["Atom-Python"]="2024-01-03T10:00:00"
  ["Automation"]="2024-01-10T11:00:00"
  ["BeautifulSoup"]="2024-01-18T09:00:00"
  ["Closure"]="2024-01-25T14:00:00"
  ["Closures"]="2024-02-02T10:00:00"
  ["Combinations-Permutations"]="2024-02-10T11:00:00"
  ["Cron-Tasks"]="2024-02-18T09:00:00"
  ["Datetime"]="2024-02-25T14:00:00"
  ["Decorators"]="2024-03-04T10:00:00"
  ["Django_Blog"]="2024-03-12T11:00:00"
  ["EAFP"]="2024-03-20T09:00:00"
  ["Exceptions"]="2024-03-28T14:00:00"
  ["Ex-Machina"]="2024-04-05T10:00:00"
  ["FC_Functions"]="2024-04-13T11:00:00"
  ["For_Else"]="2024-04-21T09:00:00"
  ["Generators"]="2024-04-29T14:00:00"
  ["Idempotence"]="2024-05-07T10:00:00"
  ["List_Comp"]="2024-05-15T11:00:00"
  ["Logging-Advanced"]="2024-05-23T09:00:00"
  ["Logging-Basics"]="2024-05-31T14:00:00"
  ["Memoization"]="2024-06-08T10:00:00"
  ["Mutable"]="2024-06-16T11:00:00"
  ["NamedTuples"]="2024-06-24T09:00:00"
  ["Object-Oriented"]="2024-07-02T14:00:00"
  ["Python"]="2024-07-10T10:00:00"
  ["Python-Conditionals"]="2024-07-18T11:00:00"
  ["Python-Context-Managers"]="2024-07-26T09:00:00"
  ["Python-CSV"]="2024-08-03T14:00:00"
  ["Python-Decorator-Arguments"]="2024-08-11T10:00:00"
  ["Python-Dicts"]="2024-08-19T11:00:00"
  ["Python-Files"]="2024-08-27T09:00:00"
  ["Python-Functions"]="2024-09-04T14:00:00"
  ["Python-Future-Date"]="2024-09-12T10:00:00"
  ["Python-Imports"]="2024-09-20T11:00:00"
  ["Python-Ints"]="2024-09-28T09:00:00"
  ["Python-JSON"]="2024-10-06T14:00:00"
  ["Python-Lists"]="2024-10-14T10:00:00"
  ["Python-Loops"]="2024-10-22T11:00:00"
  ["Python-Patreon-CSV"]="2024-10-30T09:00:00"
  ["Python-Random"]="2024-11-07T14:00:00"
  ["Python-Regular-Expressions"]="2024-11-15T10:00:00"
  ["Python-SQLite"]="2024-11-23T11:00:00"
  ["Python-Strings"]="2024-12-01T09:00:00"
  ["Python-Unit-Testing"]="2024-12-09T14:00:00"
  ["Regular-Expressions"]="2024-12-14T10:00:00"
  ["Scope"]="2024-12-17T11:00:00"
  ["Slicing"]="2024-12-19T09:00:00"
  ["Starting_Code"]="2024-12-21T14:00:00"
  ["String-Formatting"]="2024-12-23T10:00:00"
  ["Str_Repr"]="2024-12-25T11:00:00"
  ["Terminal"]="2024-12-28T09:00:00"
)

for FOLDER in "${!COMMIT_DATES[@]}"; do
  DATE="${COMMIT_DATES[$FOLDER]}"
  [ -d "$BASE_DIR/$FOLDER" ] || { echo "Skipping $FOLDER (not found)"; continue; }

  echo ">>> Committing $FOLDER ($DATE)"
  git add "$BASE_DIR/$FOLDER"
  GIT_AUTHOR_DATE="$DATE" GIT_COMMITTER_DATE="$DATE" \
    git commit -m "Add $FOLDER"
done

git push origin main --force
echo "All done."
