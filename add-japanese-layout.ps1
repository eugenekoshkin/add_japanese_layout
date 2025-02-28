# Получаем текущий список языков
$languageList = Get-WinUserLanguageList

#Write-Output $languageList

# Проверяем, есть ли японская раскладка (ja-JP) в списке
$japaneseLayout = $languageList | Where-Object { $_.LanguageTag -eq "ja" }

#Write-Output $japaneseLayout

if ($japaneseLayout) {
    # Если японская раскладка есть, удаляем её
    $languageList = $languageList | Where-Object { $_.LanguageTag -ne "ja" }
    Set-WinUserLanguageList -LanguageList $languageList -Force
    Write-Host "Japanese layout removed."
} else {
    # Если японской раскладки нет, добавляем её
    $languageList.Add("ja")
    Set-WinUserLanguageList -LanguageList $languageList -Force
    Write-Host "Japanese layout added."
}

#$languageList2 = Get-WinUserLanguageList

#Write-Output $languageList2