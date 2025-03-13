// Lấy các element modal
const modal = document.querySelector('.modal');
const modalLogin = document.querySelector('.modal_login');

// Lấy các element nút đăng ký và đăng nhập
const registerBtn = document.querySelectorAll('.header__navbar-item--strong')[0];
const loginBtn = document.querySelectorAll('.header__navbar-item--strong')[1];

// Lấy các form đăng ký và đăng nhập
const registerForm = document.querySelector('.auth-form');
const loginForm = document.querySelector('.login-form');

// Lấy element overlay
const modalOverlay = document.querySelector('.modal__overlay');
const modalLoginOverlay = document.querySelector('.modal_login__overlay');

//chuyển qua tab đăng ký
registerBtn.addEventListener('click', () => {
    window.location.href = "signup.html";
});
//chuyển qua tab đăng nhập
loginBtn.addEventListener('click', () => {
    window.location.href = "login.html";
});
// // Thêm sự kiện click vào nút đăng ký để mở modal với form đăng ký
// registerBtn.addEventListener('click', () => {
//     modal.style.display = 'block';          // Hiển thị modal đăng ký
//     modalLogin.style.display = 'none';      // Đảm bảo modal đăng nhập ẩn đi
//     registerForm.style.display = 'block';   // Hiển thị form đăng ký
//     loginForm.style.display = 'none';       // Ẩn form đăng nhập
// });

// // Thêm sự kiện click vào nút đăng nhập để mở modal với form đăng nhập
// loginBtn.addEventListener('click', () => {
//     modalLogin.style.display = 'block';     // Hiển thị modal đăng nhập
//     modal.style.display = 'none';           // Đảm bảo modal đăng ký ẩn đi
//     loginForm.style.display = 'block';      // Hiển thị form đăng nhập
//     registerForm.style.display = 'none';    // Ẩn form đăng ký
// });

// // Thêm sự kiện click vào overlay để đóng modal đăng ký
// modalOverlay.addEventListener('click', () => {
//     modal.style.display = 'none';           // Ẩn modal đăng ký
//     registerForm.style.display = 'none';    // Ẩn form đăng ký
// });

// // Thêm sự kiện click vào overlay để đóng modal đăng nhập
// modalLoginOverlay.addEventListener('click', () => {
//     modalLogin.style.display = 'none';      // Ẩn modal đăng nhập
//     loginForm.style.display = 'none';       // Ẩn form đăng nhập
// });
// // Lấy các element switch buttons trong modal
// const switchToLoginBtn = document.querySelector('.auth-form__switch-btn');   // Nút chuyển sang đăng nhập từ form đăng ký
// const switchToRegisterBtn = document.querySelector('.login-form__switch-btn'); // Nút chuyển sang đăng ký từ form đăng nhập

// // Chuyển từ đăng ký sang đăng nhập
// if (switchToLoginBtn) {
//     switchToLoginBtn.addEventListener('click', () => {
//         modalLogin.style.display = 'block';     
//         modal.style.display = 'none';           
//         loginForm.style.display = 'block';      
//         registerForm.style.display = 'none'; 
//     });
// }

// // Chuyển từ đăng nhập sang đăng ký
// if (switchToRegisterBtn) {
//     switchToRegisterBtn.addEventListener('click', () => {
//         modal.style.display = 'block';          
//         modalLogin.style.display = 'none';      
//         registerForm.style.display = 'block';   
//         loginForm.style.display = 'none';          
//     });
// }

// // Thêm sự kiện click vào nút hủy để tắt tab đăng nhập và đăng ký
// document.querySelectorAll('.auth-form__controls .btn-singup, .login-form__controls .btn-login').forEach(btn => {
//     btn.addEventListener('click', () => {
//         modalLogin.style.display = 'none';
//         modal.style.display = 'none';
//         loginForm.style.display = 'none';
//         registerForm.style.display = 'none';
//     });
// });


