const tagResult = document.getElementById("tagResult");
const tagform = document.getElementById("tagform");

tagform.addEventListener("submit", process);
tagform.querySelector("#close").addEventListener("click", closeDialog);

function process(e) {
    e.preventDefault();

    let limit = '';
    let drink = '';
    let age = '';
    let gender = '';
    let peopleLimit = '';

    // 인당 한도 금액 선택 여부 확인
    const limitChecked = document.querySelector('input[name="limit"]:checked');
    limit = limitChecked ? limitChecked.value : '선택안함';

    // 음주 유무 선택 여부 확인
    const drinkChecked = document.querySelector('input[name="drink"]:checked');
    drink = drinkChecked ? drinkChecked.value : '선택안함';

    // 나이 선택 여부 확인
    const ageChecked = document.querySelector('input[name="age"]:checked');
    age = ageChecked ? ageChecked.value : '선택안함';

    // 성별 선택 여부 확인
    const genderChecked = document.querySelector('input[name="gender"]:checked');
    gender = genderChecked ? genderChecked.value : '선택안함';

    // 인원수 선택 여부 확인
    const peopleLimitChecked = document.querySelector('input[name="peopleLimit"]:checked');
    peopleLimit = peopleLimitChecked ? peopleLimitChecked.value : '선택안함';

    const dateChecked = document.querySelector('input[name="when"]');
    dateChecked = dateChecked ? dateChecked.value : '선'

    // 결과를 tagResult 영역에 출력합니다.
    tagResult.innerHTML = `<p>인당 한도 금액: ${limit}</p>
                           <p>음주 유무: ${drink}</p>
                           <p>나이: ${age}</p>
                           <p>성별: ${gender}</p>
                           <p>인원수: ${peopleLimit}</p>`;
                           dialogForm.close();
}

function closeDialog(e) {
    e.preventDefault(); // 기본 동작 중지
    dialogForm.close();
}