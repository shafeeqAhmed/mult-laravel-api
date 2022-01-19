<tr>
    <td class="header">
        <a href="{{ $url }}" style="display: inline-block;">
            @if (trim($slot) === 'Laravel')
                <img src="https://multijunction.co.za/public/uploads/logo/Aao5Ok7VV5iXqAky6uXUy94C6LX27g5vBPGgQXkR.png"
                    class="logo" alt="Laravel Logo">
            @else
                {{ $slot }}
            @endif
        </a>
    </td>
</tr>
