function selectAllCheckbox(selectAllId, itemClass) {
    const master = document.getElementById(selectAllId);
    const items = document.getElementsByClassName(itemClass);

    Array.from(items).forEach(cb => {
        cb.checked = master.checked;
    });
}


function resetSelectAllCheckBox(selectAllId, itemClass) {
    const master = document.getElementById(selectAllId);
    const items = document.getElementsByClassName(itemClass);

    const allChecked = Array.from(items).every(cb => cb.checked);

    master.checked = allChecked;
}