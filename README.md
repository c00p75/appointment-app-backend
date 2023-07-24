### Table of Contents

- [📖 About the Project](#about)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [📝 API documentation](#license)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

### About  <a name="about-project"></a>

CycleCruise is an app to create an appointment to test drive a motorcyle.

## Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li>HTML(erb), CSS</li>
  </ul>
</details>

<details>
  <summary>Frontend</summary>
  <ul>
    <li>React</li>
  </ul>
</details>

<details>
  <summary>Backend</summary>
  <ul>
    <li>Ruby on Rails</li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- Add appointment for a motorbike
- Delete appointment for a motorbike
- Create and Delete motorbikes


<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need: 
- Any web-browser.
- Latest version of Ruby on Rails

### Setup

This API is consumed by its front-end counterpart [front-end](https://github.com/c00p75/appointment-app-frontend)

Clone this [repo](https://github.com/c00p75/appointment-app-backend.git) to your desired folder.

```
    git clone https://github.com/c00p75/appointment-app-backend.git
```

### Install

Run from a terminal

```
    cd appointment-app-backend
    bundle install
```

### Database
**To connect the project to the database:-**
```
    rails db:create
    rails db:migrate
```

### Usage

**To run the project follow the following instruction:-**

```
    rails server
```

### Run tests (using rspec)

To run tests

```
  bundle exec rspec
```

### Deployment

You can deploy this project using: [render](https://render.com/).

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>

## API Documentation

**Once connected to the database, you can check the full API Documentation in here (please, double check the port):**
```
//127.0.0.1:3050/api-docs/
```
 

## Authors <a name="authors"></a>

👤 **Damilare Adepoju**

- GitHub: [@githubhandle](https://github.com/adamilare)
- LinkedIn: [LinkedIn](https://linkedin.com/in/damilareadepoju)

👤 **George M'sapenda**

- GitHub: [@c00p75](https://github.com/c00p75)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/georgemsapenda/)


👤 **Martin Ossa**

- GitHub: [@maov19](https://github.com/maov19)
- LinkedIn: [Martin Ossa](https://linkedin.com/in/martin-ossa)

👤 **Williams Serubiri**

- GitHub: [@veronica365](https://github.com/veronica365)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/william-sserubiri-veronica/)


## Future Features <a name="future-features"></a>

- **Add user confirmation**
- **Delete reservations**
- **Edit moto description**


<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues).

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## Support <a name="support"></a>

If you like this project give us a ⭐️.

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## Acknowledgments <a name="acknowledgements"></a>

We would like to thank Microverse for this project and [Murat Korkmaz on Behance](https://www.behance.net/muratk) for the original design idea.

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>


## License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#table-of-contents">back to top</a>)</p>