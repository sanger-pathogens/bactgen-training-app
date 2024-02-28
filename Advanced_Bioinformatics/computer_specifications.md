<h1 style="text-align:center"><span style="color:#246CAA; font-size:1.5em">Computer Specifications</span></h1>

## Definitions

We will begin by defining a few concepts about computers that will be frequently used throughout this course.

- **The Central Processing Unit (CPU) -** also known as the processor, provides the instructions and processing power the computer needs to do its work. It executes instructions of a computer program, such as arithmetic, logic, controlling, and input/output (I/O) operations. Within the CPU, we have cores and threads. They represent the CPU's processing capabilities and play a crucial role in its performance.
  - **Cores:** Cores are individual processing units within a CPU. Each core is capable of executing instructions and performing calculations independently. A CPU with multiple cores can handle multiple tasks or threads simultaneously, which can lead to improved multitasking and overall performance. For example, a quad-core CPU has four cores, and an octa-core CPU has eight cores.
  - **Threads:** Threads, in the context of a CPU, refer to virtual processing units. They are created by the CPU to handle specific tasks or processes. Each core can often support multiple threads, which allows the CPU to work on multiple tasks concurrently. This technology is known as multithreading. For instance, a CPU with hyper-threading technology might have two threads per core, effectively doubling the number of threads it can handle.

    **Note:** Having multiple cores and threads can significantly improve a CPU's performance, especially in scenarios where multiple tasks or applications are running simultaneously, such as in modern computing environments where multitasking is common. It enables smoother and more efficient processing of tasks, reducing bottlenecks and enhancing overall system responsiveness.
- **Random Access Memory (RAM) -** it is your computer's short-term memory. This is where the data is stored that your computer processor needs to run your applications and open your files.
- **Hard disk drive (HDD) -** HDD Is a data storage device used in computers to store and retrieve digital information. It is a non-volatile storage medium, meaning it retains data even when the power is turned off. HDDs have been a common form of secondary storage for many years, although they are gradually being replaced by Solid-State Drives (SSDs) in many applications due to the latter's faster speed and other advantages.
- **Solid-state drive (SSD) space -** SSD is a storage device that uses fast and durable memory chips to store data in electronic form. It provides storage space for your files, applications, and operating system in your computer or device, serving as a modern and speedy alternative to traditional HDDs

<div style="text-align:center">
    <img width="80%" alt="Basic computer architecture" src="/Advanced_Bioinformatics/img/computer_architecture.png">
</div>

To successfully complete this course, you will need ~100GB HDD/SSD free space in a single partition/drive and at least 16GB of RAM, to store input data (i.e., raw reads [FASTQ files] and databases [Kraken; serotyping databases (seroba_k71_14082017 & GBS-SBG); and PopPUNK database]), and output data.

Outside this course, the choice of computing platform can be selected based on amount of data generated per year. For example, if generating:
- <100 raw reads in a year, you can use a laptop/personal computer to analyse your data.
- between 100 - 1000 reads, you might need a workstation which is a high-performance computer system that is basically designed for a single user and has advanced graphic capabilities, large storage capacity, and a powerful central processing unit. A workstation is more capable than a personal computer(PC)/laptop but is less advanced than a server.
- \>1000 raw reads in a year, you will need server/cluster - a server is a specialised computer or software system designed to provide services, resources (especially CPU and RAM), or data to other computers or devices, known as clients, over a network. Clusters are groups of servers that are managed together and participate in workload management.

<div style="text-align:center">
    <img width="80%" alt="Computer types" src="/Advanced_Bioinformatics/img/computer_type.png">
</div>

## Operating systems

An operating system (OS) is a fundamental software component that manages and controls a computer's hardware resources and provides a foundation for running applications. It serves as an intermediary between the hardware and software, allowing users and applications to interact with and utilize the computer's resources effectively.

Unix, Linux, and Windows are three different families of OS used on computers and servers. Here are some key differences between them:

- **Unix:** is one of the earliest operating systems, developed at AT&T's Bell Labs in the late 1960s. It has a rich history and served as the inspiration for many other operating systems. Unix operating systems are often proprietary and require licenses. Different flavors of Unix (e.g., AIX, HP-UX, Solaris) have different owners and licensing terms.
- **Linux:** is a Unix-like operating system that was developed in the early 1990s by Linus Torvalds. It is based on Unix principles and design but is open-source and community-driven. Linux is open-source and distributed under various licenses, such as the GNU General Public License (GPL). This means it is generally free to use, modify, and distribute. Types of Linux distributions include: Ubuntu, Debian, Fedora etc.
- **Windows:** is developed by Microsoft and has its roots in MS-DOS, which was released in the 1980s. Windows has a distinct development history from Unix-based systems.Windows is proprietary software, and users need to purchase licenses for its use. Microsoft offers different editions with varying features and licensing models.

  **Note**

  Both Unix and Linux provide text-based and graphical user interfaces. Users can choose to work in a command-line environment or use graphical desktop environments. While Unix and Linux have graphical interfaces, they are known for their powerful command-line interfaces. Many tasks and system administration can be performed more efficiently through the command line. These operating systems use a hierarchical file system with directories and files. File paths are case-sensitive.

  Windows is primarily known for its graphical user interface (GUI), with versions like Windows 10 and 11 offering a modern, user-friendly desktop interface. Windows has a strong emphasis on GUI-based interaction, and many users may not need to use the command line for day-to-day tasks.

  **If you are a Windows user, we recommend that you install Linux OS given that it has powerful command-line interfaces.**

    **How to install Ubuntu in Windows computer**:

    To install Ubuntu on a Windows computer, you can use the Windows Subsystem for Linux (WSL), which allows you to run a Linux distribution alongside your existing Windows installation without the need for dual-booting. Here are the steps to install Ubuntu using WSL:

    **a. Prerequisites:**
    1. Windows 10 or later: Ensure that you are running Windows 10 or a later version.

    2. Enable Virtualization: Ensure that virtualization is enabled in your BIOS/UEFI settings. You can check if virtualisation is enabled on your task manager as shown in the image below

    ![Windows Virtualization](/img/windows_virtualization.png "windows_virtualization")

    **b. Install Ubuntu using CLI:**

    3. Open PowerShell: Open PowerShell as Administrator.

    4. Install Ubuntu:
    ```
    wsl --install
    ```

    5. Launch Ubuntu: After the installation is complete, restart your machine, then launch Ubuntu by running:
    ```
    ubuntu
    ```

    6. Set Up Ubuntu: The first time you launch Ubuntu, it will ask you to set up a new user account with a username and password.

    **c. Update and upgrade:**

    After setting up Ubuntu, it's a good idea to update the package lists and upgrade the installed packages to ensure you have the latest software versions. Open the Ubuntu terminal and run the following commands:

    ```
    sudo apt update
    sudo apt upgrade 
    ```

    <style>body {text-align: justify}</style>