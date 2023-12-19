function validateLetters(input) {
    // Remove non-letter and non-space characters
    input.value = input.value.replace(/[^a-zA-Z\s]/g, '');
}

function validateEmailInput(input) {
    // Remove any repeated '@' characters
    input.value = input.value.replace(/@+/g, '@');

    // Remove characters other than letters, digits, '@', '.', '_', and '-'
    input.value = input.value.replace(/[^a-zA-Z0-9@._-]/g, '');
}

function validateContactInput(input){
    input.value = input.value.replace(/[^0-9]/g, '');
}