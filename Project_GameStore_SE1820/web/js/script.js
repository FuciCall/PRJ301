const gameImages = [
    {
        main: "images/eldenring_main.jpg",
        thumbnails: ["images/eldenring_1.jpg", "images/eldenring_2.jpg", "images/eldenring_3.jpg", "images/eldenring_4.jpg"],
        title: "Elden Ring",
        price: "990.000₫"
    },
    {
        main: "images/pubg_main.jpg",
        thumbnails: ["images/pubg_1.jpg", "images/pubg_2.jpg", "images/pubg_3.jpg", "images/pubg_4.jpg"],
        title: "PUBG",
        price: "340.000₫"
    },
    {
        main: "images/lol_main.jpg",
        thumbnails: ["images/lol_1.jpg", "images/lol_2.jpg", "images/lol_3.jpg", "images/lol_4.jpg"],
        title: "League of Legends",
        price: "Free to Play"
    },
    {
        main: "images/cyberpunk_main.jpg",
        thumbnails: ["images/cyberpunk_1.jpg", "images/cyberpunk_2.jpg", "images/cyberpunk_3.jpg", "images/cyberpunk_4.jpg"],
        title: "Cyberpunk 2077",
        price: "750.000₫"
    },
    {
        main: "images/reddead_main.jpg",
        thumbnails: ["images/reddead_1.jpg", "images/reddead_2.jpg", "images/reddead_3.jpg", "images/reddead_4.jpg"],
        title: "Red Dead Redemption 2",
        price: "1.200.000₫"
    }
];

let currentGameIndex = 0;

function updateGameDisplay() {
    const game = gameImages[currentGameIndex];
    document.getElementById("mainImage").src = game.main;
    document.getElementById("gameTitle").textContent = game.title;
    document.getElementById("gamePrice").textContent = game.price;

    const thumbnails = document.querySelectorAll(".thumbnail");
    thumbnails.forEach((thumb, index) => {
        thumb.src = game.thumbnails[index];
        thumb.onclick = () => {
            document.getElementById("mainImage").src = game.thumbnails[index];
        };
    });
}

function nextGame() {
    currentGameIndex = (currentGameIndex + 1) % gameImages.length;
    updateGameDisplay();
}

function prevGame() {
    currentGameIndex = (currentGameIndex - 1 + gameImages.length) % gameImages.length;
    updateGameDisplay();
}

document.addEventListener("DOMContentLoaded", updateGameDisplay);
