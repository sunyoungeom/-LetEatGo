const tagform = document.getElementById("tagform");
const closeTagDialogBtn = document.getElementById("closeTagDialog");
const confirmTagDialogBtn = document.getElementById("confirmTagDialog");

tagform.addEventListener("submit", process);
closeTagDialogBtn.addEventListener("click", closeTagDialog);
confirmTagDialogBtn.addEventListener("click", confirmTagDialog);

function process(e) {
    
}

function closeTagDialog() {
    dialogForm.close();
}

function confirmTagDialog(e) {
  e.preventDefault();

    let budget = '';
    let booze = '';
    let age = '';
    let gender = '';
    let peopleLimit = '';

    // 인당 한도 금액 선택 여부 확인
    const limitChecked = document.querySelector('input[name="budget"]:checked');
    budget = limitChecked ? limitChecked.value : '선택안함';

    // 음주 유무 선택 여부 확인
    const drinkChecked = document.querySelector('input[name="booze"]:checked');
    booze = drinkChecked ? drinkChecked.value : '선택안함';

    // 나이 선택 여부 확인
    const ageChecked = document.querySelector('input[name="age"]:checked');
    age = ageChecked ? ageChecked.value : '선택안함';

    // 성별 선택 여부 확인
    const genderChecked = document.querySelector('input[name="gender"]:checked');
    gender = genderChecked ? genderChecked.value : '선택안함';

    // 인원수 선택 여부 확인
    const peopleLimitChecked = document.querySelector('input[name="peopleLimit"]:checked');
    peopleLimit = peopleLimitChecked ? peopleLimitChecked.value : '선택안함';

    // 결과를 tagResult 영역에 출력합니다.
    tagResult.innerHTML = `<p>인당 한도 금액: ${budget}</p>
                           <p>음주 유무: ${booze}</p>
                           <p>나이: ${age}</p>
                           <p>성별: ${gender}</p>
                           <p>인원수: ${peopleLimit}</p>`;
    dialogForm.close();
}
