on run
    set selectedText to "{popclip text}"

    tell application "Safari"
        activate
        open location "https://nara-speller.co.kr/speller"
        delay 0.5 -- 페이지 로딩 대기 (필요시 시간 조절)

        -- 1. textarea에 텍스트 입력 및 input 이벤트 발생
        do JavaScript "
            var textarea = document.querySelector('textarea');
            if (textarea) {
                textarea.focus();
                textarea.value = `" & selectedText & "`;
                textarea.dispatchEvent(new Event('input', { bubbles: true }));
            }
        " in document 1

        -- 2. input 이벤트에 의한'검사하기' 버튼 활성화를 위해 0.2초 대기
        delay 0.2

        -- 3. '검사하기' 버튼 클릭
        do JavaScript "
            var buttons = document.querySelectorAll('button');
            for (var i = 0; i < buttons.length; i++) {
                if (buttons[i].textContent.trim() === '검사하기') {
                    buttons[i].click();
                    break;
                }
            }
        " in document 1
    end tell
end run
