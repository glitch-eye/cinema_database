let nowPlaying = document.getElementsByClassName("row nowPlaying")[0];
let upcoming = document.getElementsByClassName("row upcoming")[0];

let api = {
    url: "https://api.themoviedb.org/3/movie/",
    key: "api_key=8ff5e2fbb1b643a55f0256bb89a8a192",
};

let apiImg = {
    url: "https://image.tmdb.org/t/p/w200"
};

let urls = [
    `${api.url}now_playing?${api.key}&language=en-US&page=1`,
    `${api.url}upcoming?${api.key}&language=en-US&page=1&region=CA`
];

let initDisplay = () => {
    Promise.all(urls.map(url =>
        fetch(url).then(resp => resp.json())
    ))
    .then(data => {
        nowPlayingDisplay(data[0]);
        upcomingDisplay(data[1]);
    });
};

let nowPlayingDisplay = (movie) => {
    let ul = nowPlaying.getElementsByTagName("ul")[0];
    movie.results.forEach(film => {
        let li = document.createElement("li");
        li.className = "nowPlayingMovie";
        li.setAttribute("id", film.genre_ids);

        let img = document.createElement("img");
        img.src = `${apiImg.url}${film.poster_path}`;

        let p = document.createElement("p");
        p.innerText = film.title;

        li.appendChild(img);
        li.appendChild(p);
        ul.appendChild(li);
    });
};


let upcomingDisplay = (movie) => {
    let ul = upcoming.getElementsByTagName("ul")[0];
    movie.results.forEach(film => {
        let li = document.createElement("li");
        li.className = "upcomingMovie";
        li.setAttribute("id", film.genre_ids);

        let img = document.createElement("img");
        img.src = `${apiImg.url}${film.poster_path}`;

        let p = document.createElement("p");
        p.innerText = film.title;

        li.appendChild(img);
        li.appendChild(p);
        ul.appendChild(li);
    });
};

window.addEventListener("load", initDisplay);
