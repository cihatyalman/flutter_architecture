# Flutter Architecture

Projelerinizde kullanabileceğiniz flutter mimarisi. [ Update: 20.06.2025 ]

#

"lib" klasörünü projenizin lib klasörü ile değiştirerek kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.

NOT: cache_service.dart dosyasında bulunan 'cacheName' değişkenini değiştirmeyi unutmayın.

#

### Kullanılan kütüphaneler:

<table>
  <tr valign="top">
    <td>
      <ul>
        <li>API Service</li>
        <ul>
          <li>dio</li>
        </ul>
        <li>Cache</li>
        <ul>
          <li>hive</li>
          <li>hive_flutter</li>
        </ul>
        <li>Widgets</li>
        <ul>
          <li>animator</li>
          <li>another_flushbar</li>
          <li>cached_network_image</li>
        </ul>
      </ul>
    </td>
    <td>
      <li>Other</li>
      <ul>
        <li>intl</li>
        <li>path_provider</li>
        <li>mask_text_input_formatter</li>
        <li>auto_size_text</li>
        <li>animated_bottom_navigation_bar</li>
      </ul>
    </td>
  </tr>
</table>

<!-- # api -->
  <!-- dio:  -->
<!--  -->
  <!-- # widgets -->
  <!-- animator:  -->
  <!-- another_flushbar:  -->
  <!-- cached_network_image:  -->
<!--  -->
  <!-- # cache -->
  <!-- hive:  -->
  <!-- hive_flutter:  -->
<!--  -->
  <!-- # other -->
  <!-- intl:  -->
  <!-- path_provider:  -->
  <!-- mask_text_input_formatter:  -->
  <!-- auto_size_text:  -->
<!--  -->
  <!-- # projects -->
  <!-- animated_bottom_navigation_bar:  -->

<br>

# Mimari

- #### [core](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/core): Projeden bağımsız olarak çalışan kodlar içerir. Bu katmanı [dışarıdan](https://github.com/cihatyalman/flutter_core) entegre edebilirsiniz.
- #### [constants](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/constants): Projede kullanılacak sabitler burada tutulur. Bunlar renk, icon, resim, yazı, yazı formatı gibi alanlar olabilir.
- #### [controllers](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/controllers): Api istekleri burada tutulur.
- #### [helpers](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/helpers): Kodlama yaparken bize yardımcı olacak kodlar burada tutulur.
- #### [widgets/custom](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/widgets/custom): Projeden bağımsız olarak oluşturulan widgetlar burada tutulur.
- #### [widgets/project](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/widgets/project): Projeye özgü widgetlar burada tutulur.
- #### [models](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/models): Projede kullanılacak modeller burada tutulur.
- #### [views](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/views): Tasarlanan uygulama ekranları burada tutulur.
- #### [view_models](https://github.com/cihatyalman/flutter_architecture/tree/master/lib/view_models): View ile model arasındaki iletişimi sağlar. İş kodları burada tutulur.

<br>

# Flutter Snippet
Kod yazarken bize yardımcı olacak hazır [kod parçaları](https://github.com/cihatyalman/flutter_architecture/tree/master/flutter.code-snippets).

