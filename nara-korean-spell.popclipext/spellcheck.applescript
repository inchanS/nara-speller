on run
    set selectedText to "{popclip text}"

    display dialog "PopClip에서 전달된 텍스트는: " & selectedText -- Popclip 텍스트 전달 확인

    tell application "Safari"
        activate
        set newTab to make new document with properties {URL:"https://nara-speller.co.kr/speller"}
        delay 0.1
    end tell

    tell application "System Events"
        tell process "Safari"
            -- 페이지에서 텍스트 영역 클릭
            delay 0.1
            key code 48 -- Tab 키로 입력 필드로 이동
            delay 0.1
            key code 48 -- Tab 키로 입력 필드로 이동
            delay 0.1
            key code 48 -- Tab 키로 입력 필드로 이동
            delay 0.1

            -- 선택된 텍스트 복사
            set the clipboard to selectedText
            delay 0.1

            -- 클립보드 내용 붙여넣기 (Cmd+V)
            key code 9 using command down
            delay 0.1

            -- Enter 키 또는 검사 버튼 클릭
            key code 48 -- Tab 키로 입력 필드로 이동
            delay 0.1
            key code 36 -- Enter 키
        end tell
    end tell
end run
