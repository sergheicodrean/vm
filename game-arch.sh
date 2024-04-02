qemu-system-x86_64 -m 4G -cpu host -enable-kvm -smp 4 -hdb ./_game-data.qcow2 -hda _gamer-arch.qcow2 -device virtio-vga-gl -display sdl,gl=on -soundhw all -nic none
